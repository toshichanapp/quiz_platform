# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TypingQuestion, type: :model do
  describe '#valid?' do
    let(:typing_question) { build(:typing_question) }
    subject { typing_question }

    context 'when body is blank' do
      it 'be invalid' do
        typing_question.body = ''
        expect(typing_question).to be_invalid
        expect(typing_question.errors[:body]).to include('Bodyを入力してください。')

        typing_question.body = ' '
        expect(typing_question).to be_invalid
        expect(typing_question.errors[:body]).to include('Bodyを入力してください。')

        typing_question.body = nil
        expect(typing_question).to be_invalid
        expect(typing_question.errors[:body]).to include('Bodyを入力してください。')
      end
    end

    context 'when typing_body is blank' do
      it 'be invalid' do
        typing_question.typing_body = ''
        expect(typing_question).to be_invalid
        expect(typing_question.errors[:typing_body]).to include('Typing bodyを入力してください。')

        typing_question.typing_body = ' '
        expect(typing_question).to be_invalid
        expect(typing_question.errors[:typing_body]).to include('Typing bodyを入力してください。')

        typing_question.typing_body = nil
        expect(typing_question).to be_invalid
        expect(typing_question.errors[:typing_body]).to include('Typing bodyを入力してください。')
      end
    end

    context 'when typing_body is invalid format' do
      it 'be invalid' do
        typing_question.typing_body = '日本語'
        expect(typing_question).to be_invalid
        expect(typing_question.errors[:typing_body]).to include('Typing bodyは不正な値です。')
      end
    end
  end
end
