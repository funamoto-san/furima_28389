class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/ # e-mail
    VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/ # 半角アルファベット（大文字・小文字・数値）
    VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/ # 全角ひらがな、漢字
    VALID_NAME_READING_REGEX = /\A[ァ-ヶー－]+\z/ # 全角カタカナ
    VALID_HALF_WIDTH_DIGIT_REGEX = /\A[0-9]+\z/ #半角数字

end
