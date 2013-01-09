require 'rubygems'


class String
  def truncate(options)
    length = options[:length] || 140
    "#{self[0..length].chomp}..."
  end
end