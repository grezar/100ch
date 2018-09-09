ROOT_DIR = File.dirname(__FILE__)
$LOAD_PATH.unshift(ROOT_DIR) unless $LOAD_PATH.include?(ROOT_DIR)

require 'app'
run App
