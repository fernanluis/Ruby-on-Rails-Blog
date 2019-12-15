class Article < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :has_categories
  has_many :categories, through: :has_categories
  attr_accessor :category_elements
  has_many :comments, dependent: :destroy

  def save_categories
    #category_elements 1,2,3
    #convertir eso en un arreglo 1,2,3 => [1,2,3]
    #categories_array = category_elements.split(",") multipe:true enviaba como un arreglo a catagory_elements, ya no es un string y poreso no lo convertimos en un arreglo porque ya lo es.
    #Iterar este arreglo, y cambiamos a categories_array por category_elements
    return has_categories.destroy_all if category_elements.nil? || category_elements.empty?

    has_categories.where.not(category_id: category_elements).destroy_all

    category_elements.each do |category_id|
      #Crear HasCateogry HasCategor<article_id: 1, category_id: 2>
      #unless HasCategory.where(article:self,category_id:category_id).any?
       HasCategory.find_or_create_by(article: self, category_id: category_id)
      #end
    end
  end

end
