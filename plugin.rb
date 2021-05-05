# frozen_string_literal: true

# name: discourse-embed-complete
# about: Unskips the first post while embedding discourse
# version: 0.1
# authors: arivanandan
# url: https://github.com/arivanandan/discourse-embed-complete

enabled_site_setting :embed_complete_enabled

PLUGIN_NAME ||= 'EmbedComplete'

after_initialize do
  load File.expand_path('../lib/embed_complete.rb', __FILE__)
end
