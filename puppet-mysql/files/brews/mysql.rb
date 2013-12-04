require 'formula'

class Mysql < Formula
  homepage 'http://dev.mysql.com/doc/refman/5.5/en/'
  url 'http://downloads.mysql.com/archives/mysql-5.5/mysql-5.5.20.tar.gz'
  sha1 'd5066327c41ac5a338ca0bb748e50bc4e1902442'
  version '5.5.20-boxen2'

  depends_on 'cmake' => :build
  depends_on 'pidof'

  fails_with :llvm do
    build 2326
    cause "https://github.com/mxcl/homebrew/issues/issue/144"
  end

  skip_clean :all # So "INSTALL PLUGIN" can work.

  def options
    [
      ['--with-tests', "Build with unit tests."],
      ['--with-embedded', "Build the embedded server."],
      ['--with-archive-storage-engine', "Compile with the ARCHIVE storage engine enabled"],
      ['--with-blackhole-storage-engine', "Compile with the BLACKHOLE storage engine enabled"],
      ['--universal', "Make mysql a universal binary"],
      ['--enable-local-infile', "Build with local infile loading support"]
    ]
  end

  # Remove optimization flags from `mysql_config --cflags`
  # This facilitates easy compilation of gems using a brewed mysql
  # CMake patch needed for CMake 2.8.8.
  # Reported here: http://bugs.mysql.com/bug.php?id=65050
  def patches; DATA; end

  def install
    args = [".",
            "-DCMAKE_INSTALL_PREFIX=#{prefix}",
            "-DMYSQL_DATADIR=/opt/boxen/data/mysql",
            "-DINSTALL_MANDIR=#{man}",
            "-DINSTALL_DOCDIR=#{doc}",
            "-DINSTALL_INFODIR=#{info}",
            # CMake prepends prefix, so use share.basename
            "-DINSTALL_MYSQLSHAREDIR=#{share.basename}/#{name}",
            "-DWITH_SSL=yes",
            "-DDEFAULT_CHARSET=utf8",
            "-DDEFAULT_COLLATION=utf8_general_ci",
            "-DSYSCONFDIR=#{etc}"]

    # To enable unit testing at build, we need to download the unit testing suite
    if ARGV.include? '--with-tests'
      args << "-DENABLE_DOWNLOADS=ON"
    else
      args << "-DWITH_UNIT_TESTS=OFF"
    end

    # Build the embedded server
    args << "-DWITH_EMBEDDED_SERVER=ON" if ARGV.include? '--with-embedded'

    # Compile with ARCHIVE engine enabled if chosen
    args << "-DWITH_ARCHIVE_STORAGE_ENGINE=1" if ARGV.include? '--with-archive-storage-engine'

    # Compile with BLACKHOLE engine enabled if chosen
    args << "-DWITH_BLACKHOLE_STORAGE_ENGINE=1" if ARGV.include? '--with-blackhole-storage-engine'

    # Make universal for binding to universal applications
    args << "-DCMAKE_OSX_ARCHITECTURES='i386;x86_64'" if ARGV.build_universal?

    # Build with local infile loading support
    args << "-DENABLED_LOCAL_INFILE=1" if ARGV.include? '--enable-local-infile'

    system "cmake", *args
    system "make"
    system "make install"

    # Don't create databases inside of the prefix!
    # See: https://github.com/mxcl/homebrew/issues/4975
    rm_rf prefix+'data'

    # Link the setup script into bin
    ln_s prefix+'scripts/mysql_install_db', bin+'mysql_install_db'
    # Fix up the control script and link into bin
    inreplace "#{prefix}/support-files/mysql.server" do |s|
      s.gsub!(/^(PATH=".*)(")/, "\\1:#{HOMEBREW_PREFIX}/bin\\2")
    end
    ln_s "#{prefix}/support-files/mysql.server", bin
  end
end

__END__
diff --git a/scripts/mysql_config.sh b/scripts/mysql_config.sh
index 9296075..70c18db 100644
--- a/scripts/mysql_config.sh
+++ b/scripts/mysql_config.sh
@@ -137,7 +137,9 @@ for remove in DDBUG_OFF DSAFE_MUTEX DUNIV_MUST_NOT_INLINE DFORCE_INIT_OF_VARS \
               DEXTRA_DEBUG DHAVE_purify O 'O[0-9]' 'xO[0-9]' 'W[-A-Za-z]*' \
               'mtune=[-A-Za-z0-9]*' 'mcpu=[-A-Za-z0-9]*' 'march=[-A-Za-z0-9]*' \
               Xa xstrconst "xc99=none" AC99 \
-              unroll2 ip mp restrict
+              unroll2 ip mp restrict \
+              mmmx 'msse[0-9.]*' 'mfpmath=sse' w pipe 'fomit-frame-pointer' 'mmacosx-version-min=10.[0-9]' \
+              aes Os
 do
   # The first option we might strip will always have a space before it because
   # we set -I$pkgincludedir as the first option
diff --git a/configure.cmake b/configure.cmake
index c3cc787..6193481 100644
--- a/configure.cmake
+++ b/configure.cmake
@@ -149,7 +149,9 @@ IF(UNIX)
   SET(CMAKE_REQUIRED_LIBRARIES
     ${LIBM} ${LIBNSL} ${LIBBIND} ${LIBCRYPT} ${LIBSOCKET} ${LIBDL} ${CMAKE_THREAD_LIBS_INIT} ${LIBRT})

-  LIST(REMOVE_DUPLICATES CMAKE_REQUIRED_LIBRARIES)
+  IF(CMAKE_REQUIRED_LIBRARIES)
+    LIST(REMOVE_DUPLICATES CMAKE_REQUIRED_LIBRARIES)
+  ENDIF()
   LINK_LIBRARIES(${CMAKE_THREAD_LIBS_INIT})

   OPTION(WITH_LIBWRAP "Compile with tcp wrappers support" OFF)
