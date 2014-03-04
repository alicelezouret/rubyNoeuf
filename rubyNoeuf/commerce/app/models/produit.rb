class Produit < ActiveRecord::Base
	validates :nom, :prix, :presence => true
	validates :prix, :numericality => true
	validates :image, :format => { :with => /\Ahttp:.+(gif|png|jpg)\z/, :message => "url invalide" }
end
