# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

require 'test_helper'

# Tests basic functionality
class SpannedDefaultTest < Minitest::Test
	def test_basic
		strings = [
			[
				%(Hi w),
				%(<span>H</span><span>i</span><span> </span><span>w</span>)
			]
		]
		assert_string_array strings
	end

	def test_classes
		strings = [
			[
				%(Hi w),
				%(<span class="a">H</span><span class="a">i</span><span class="a"> </span><span class="a">w</span>),
				{ class: 'a' }
			]
		]
		assert_string_array strings
	end
end
