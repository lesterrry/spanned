# Handcrafted by Aydar N.
# 2023
#
# me@aydar.media
#

# frozen_string_literal: true

# Contains main methods
module Spanned

	class Error < StandardError; end

	# Wraps every char of text in spans
	# == Parameters:
	# +text+:: +Str+: Text to include spans in
	# +span_class+:: Optional +Str+: class to apply to every span
	# +ignore+:: Optional +Arr+: chars to skip
	# == Returns:
	# +Str+:: Formatted text
	def self.explode(text, span_class: nil, ignore: nil)
		r = ''
		in_tag = false
		leave_tag = false
		open = span_class.nil? ? %(<span>) : %(<span class="#{span_class}">)
		text.each_char do |i|
			if i == '<'
				in_tag = true
			elsif i == '>'
				leave_tag = true
			elsif leave_tag
				in_tag = leave_tag = false
			end
			r +=
					if ignore&.include?(i) or in_tag
						i
					else
						"#{open}#{i}</span>"
					end
		end
		r
	end

end
