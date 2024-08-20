PDFKit.configure do |config|
  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
  config.default_options = {
    :page_size => 'A4',
    :encoding => 'UTF-8',
    :print_media_type => false,
    :margin_top => "0.5in",
    :margin_right => "0.3in",
    :margin_bottom => "0.6in",
    :margin_left => "0.3in",
    :disable_smart_shrinking => false
  }
end