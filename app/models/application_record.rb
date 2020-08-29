class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/ # e-mail
    VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/ # 半角アルファベット（大文字・小文字・数値）
    VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/ # 全角ひらがな、全角カタカナ、漢字
    VALID_NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/ # 全角カタカナ
    VALID_HALF_WIDTH_DIGIT_REGEX = /\A[0-9]+\z/ #半角数字
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/ #郵便番号（ハイフンあり7桁）
    VALID_TEL_NUMBER_REGEX = /\A\d{10}$|^\d{11}\z/ #電話番号（ハイフンなし10桁or11桁）

end
