# Config class for PHP.

class php::config {

  $inifile = '/opt/boxen/homebrew/etc/php/5.3/php.ini'

  $short_open_tag = 'Off'
  $expose_php = 'Off'
  $max_execution_time = '60'
  $max_input_time = '60'
  $max_input_vars = '10000'
  $memory_limit = '512M'
  $error_reporting = 'E_ALL & ~E_NOTICE'
  $display_errors = 'On'
  $display_startup_errors = 'On'
  $log_errors = 'On'
  $log_errors_max_len = '1024'
  $log_dir = '/opt/boxen/log/php'
  $error_log = '/opt/boxen/log/php/error.log'
  $ignore_repeated_errors = 'Off'
  $ignore_repeated_source = 'Off'
  $report_memleaks = 'On'
  $track_errors = 'On'
  $html_errors = 'On'
  $post_max_size = '512M'
  $file_uploads = 'On'
  $upload_max_filesize = '512M'
  $max_file_uploads = '20'
  $allow_url_fopen = 'On'
  $allow_url_include = 'On'
  $date_timezone = 'Europe/Stockholm'
  $session_auto_start = '0'
  $session_cache_limiter = 'nocache'
  $session_upload_progress_enabled = 'On'
  $session_upload_progress_cleanup = 'On'

}
