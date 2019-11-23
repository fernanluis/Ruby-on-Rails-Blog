class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :has_categories
  has_many :categories, through: :has_categories
  attr_accessor :category_elements

  def save_categories
    #category_elements 1,2,3
    #convertir eso en un arreglo 1,2,3 => [1,2,3]
    categories_array = category_elements.split(",")
    #Iterar este arreglo
    categories_array.each do |category_id|
      #Crear HasCateogry HasCategor<article_id: 1, category_id: 2>
      #unless HasCategory.where(article:self,category_id:category_id).any?
       HasCategory.find_or_create_by(article: self, category_id: category_id)
     #end
    end
  end

end
