# frozen_string_literal: true

Dir[File.join(__dir__, 'services', '*.rb')].sort.each { |file| require file }
