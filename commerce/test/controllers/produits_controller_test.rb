require 'test_helper'

class ProduitsControllerTest < ActionController::TestCase
  setup do
    @produit = produits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produits)
  end
test "should show expected table of produits" do
    get :index
    assert_select 'title', 'Commerce'
    assert_select 'table'
    assert_select 'tr', 2
    assert_select 'table tbody tr.ligne0', 1
    assert_select 'table tbody tr.ligne1', 1
    assert_select 'table tbody tr td.actionsligne', 2
    assert_select 'table thead tr', {count: 1, text: /Nom\s+Description\s+Prix\s+Image/}
    assert_select  'table tbody' do
            assert_select "[class=?]", /ligne[01]/
    end
	assert_select  'table tbody tr td.actionsligne' do
            assert_select 'a', 'Afficher'
            assert_select 'a', 'Editer'
            assert_select 'a', 'Supprimer'
    end
  end
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produit" do
    assert_difference('Produit.count') do
      post :create, produit: { description: @produit.description, image: @produit.image, nom: @produit.nom, prix: @produit.prix }
    end
	assert_equal('Produit was successfully created.',flash[:notice])
    assert_redirected_to produits_path
  end

  test "should show produit" do
    get :show, id: @produit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produit
    assert_response :success
  end
  test "should update produit" do
    patch :update, id: @produit, produit: { description: @produit.description, image: @produit.image, nom: @produit.nom, prix: @produit.prix }
    assert_equal('Produit was successfully updated.',flash[:notice])
	assert_redirected_to produits_path
  end
  test "should destroy produit" do
    assert_difference('Produit.count', -1) do
      delete :destroy, id: @produit
    end

    assert_redirected_to produits_path
  end
end
