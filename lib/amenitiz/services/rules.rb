# frozen_string_literal: true

Dir[File.join(__dir__, 'rules', '*.rb')].sort.each { |file| require file }
