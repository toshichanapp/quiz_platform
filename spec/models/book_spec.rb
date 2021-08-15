require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#valid?' do
    let(:book) { build(:book) }
    subject { book }

    context 'when key is blank' do
      it 'be invalid' do
        book.key = ''
        expect(book).to be_invalid
        expect(book.errors[:key]).to include("Keyを入力してください。")

        book.key =  ' '
        expect(book).to be_invalid
        expect(book.errors[:key]).to include("Keyを入力してください。")

        book.key = nil
        expect(book).to be_invalid
        expect(book.errors[:key]).to include("Keyを入力してください。")
      end
    end

    context 'when key is invalid format' do
      it 'be invalid' do
        book.key = '日本語'
        expect(book).to be_invalid
        expect(book.errors[:key]).to include("Keyは不正な値です。")

        book.key = 'HOGE'
        expect(book).to be_invalid
        expect(book.errors[:key]).to include("Keyは不正な値です。")

        book.key = 'hoge123HOGE'
        expect(book).to be_invalid
        expect(book.errors[:key]).to include("Keyは不正な値です。")
      end
    end

    context 'when key is not unique' do
      let(:persisted_book){ create(:book) }

      it 'be invalid' do
        book.key = persisted_book.key
        expect(book).to be_invalid
        expect(book.errors[:key]).to include("Keyはすでに存在します。")
      end
    end
  end
end
