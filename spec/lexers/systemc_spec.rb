# -*- coding: utf-8 -*- #
# frozen_string_literal: true

describe Rouge::Lexers::SystemC do
  let(:subject) { Rouge::Lexers::SystemC.new }

  describe 'guessing' do
    include Support::Guessing

    it 'guesses by filename' do
      assert_guess :filename => 'foo.cpp'
      assert_guess :filename => 'foo.c++'
      assert_guess :filename => 'foo.cc'
      assert_guess :filename => 'foo.cxx'

      assert_guess :filename => 'foo.hpp'
      assert_guess :filename => 'foo.h++'
      assert_guess :filename => 'foo.hxx'

      # Disambiguate with C
      assert_guess :filename => 'foo.h', :source => 'namespace'
      deny_guess :filename => 'foo.h', :source => 'namespaces'
      deny_guess :filename => 'foo.h', :source => 'struct namespace'
    end

    it 'guesses by mimetype' do
      assert_guess :mimetype => 'text/x-c++hdr'
      assert_guess :mimetype => 'text/x-c++src'
    end
  end

  describe 'lexing' do
    include Support::Lexing

    it 'recognizes one-line comments not followed by a newline (#796)' do
      assert_tokens_equal '// comment', ['Comment.Single', '// comment']
    end
  end
end
