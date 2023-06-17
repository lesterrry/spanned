# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'spanned'

require 'minitest/autorun'

def assert_string_array(strings)
	strings.each do |i|
		cl = i[2]&.dig(:class)
		ig = i[2]&.dig(:ignore)
		f = Spanned.explode i[0], span_class: cl, ignore: ig
		assert_equal i[1], f
	end
end
