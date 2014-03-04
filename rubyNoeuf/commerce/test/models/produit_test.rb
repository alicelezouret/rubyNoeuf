require 'test_helper'

class ProduitTest < ActiveSupport::TestCase
test "ne doit pas accepter un produit vide" do
    produit = Produit.new
    assert !produit.save
end

test "ne doit pas accepter un produit sans nom" do
    produit = Produit.new
    produit.prix=9.99
	assert !produit.save
end
test "ne doit pas accepter un produit sans prix" do
    produit = Produit.new
    produit.nom='p1'
	assert !produit.save
end

test "ne doit pas accepter un produit sans nom numerique" do
    produit = Produit.new
	produit.prix='prix'
    assert !produit.save
end
test "ne doit pas accepter une image pdf" do
    produit = Produit.new
	produit.image='http://x.y/image.pdf'
    assert !produit.save
end
test "ne doit pas accepter une image qui ne soit une url http" do
    produit = Produit.new
	produit.image='file://x.y/image.pdf'
    assert !produit.save
end
test "accepter les images gif, png ou jpg" do
['gif','png','jpg'].each{|type|
	produit = Produit.new
	produit.nom="p#{type}"
	produit.prix=0.5
	produit.image="http://x.y/image.#{type}"
	assert produit.save
	}
end
end
