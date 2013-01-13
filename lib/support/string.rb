require 'rubygems'

module Pantheon
  class String
    def truncate(length)
      length > self.length ? self : "#{self[0..length].chomp}..."
    end

    def remove_tags()
      self.gsub(/<!DOCTYPE.*?>/i, "")
          .gsub(/<\/{0,1}\w.*?>/, "")
    end
  end
end