require 'rails_helper'

RSpec.describe TypingChapter, type: :model do
  describe '#valid?' do
    let(:chapter) { create(:typing_chapter) }
    subject { chapter }
    context 'when key is blank' do
      it 'be invalid' do
        chapter.key = ''
        expect(chapter).to be_invalid
        expect(chapter.errors[:key]).to include("Keyを入力してください。")

        chapter.key =  ' '
        expect(chapter).to be_invalid
        expect(chapter.errors[:key]).to include("Keyを入力してください。")

        chapter.key = nil
        expect(chapter).to be_invalid
        expect(chapter.errors[:key]).to include("Keyを入力してください。")
      end
    end
    context 'when key is invalid format' do
      it 'be invalid' do
        chapter.key = '日本語'
        expect(chapter).to be_invalid
        expect(chapter.errors[:key]).to include("Keyは不正な値です。")

        chapter.key = 'HOGE'
        expect(chapter).to be_invalid
        expect(chapter.errors[:key]).to include("Keyは不正な値です。")

        chapter.key = 'hoge123HOGE'
        expect(chapter).to be_invalid
        expect(chapter.errors[:key]).to include("Keyは不正な値です。")
      end
    end
    context 'when key is not unique in scope' do
      let(:persisted_chapter){ create(:typing_chapter, book: chapter.book, key: 'persisted') }

      it 'be invalid' do
        chapter.key = persisted_chapter.key
        expect(chapter).to be_invalid
        expect(chapter.errors[:key]).to include("Keyはすでに存在します。")
      end
    end

    context 'when key is unique in scope' do
      let(:persisted_chapter){ create(:typing_chapter, book: create(:book, key: 'persisted')) }

      it 'be valid' do
        chapter.key = persisted_chapter.key
        expect(chapter).to be_valid
      end
    end
  end
end
