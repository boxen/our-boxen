if [[ `security list-keychains | grep default | wc -l` -eq 0 ]]; then
  echo "Setting up keychain..."

  security create-keychain -p vagrant default
  security default-keychain -d user -s default

  # Overriding default settings (lock-on-sleep timeout=300s)
  security set-keychain-settings default
fi

echo "Unlocking keychain..."
security unlock-keychain -p vagrant
