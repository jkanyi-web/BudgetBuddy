require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
    @transaction = transactions(:one)
  end

  test 'should get index' do
    get category_transactions_url(@category)
    assert_response :success
    assert_not_nil assigns(:transactions)
  end

  test 'should get new' do
    get new_category_transaction_url(@category)
    assert_response :success
  end

  test 'should create transaction' do
    assert_difference('Transaction.count') do
      post category_transactions_url(@category), params: { transaction: { title: 'New Transaction', amount: 10.0, category_id: @category.id } }
    end

    assert_redirected_to category_transaction_url(@category, Transaction.last)
    assert_equal 'Transaction was successfully created.', flash[:notice]
  end

  test 'should show transaction' do
    get category_transaction_url(@category, @transaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_transaction_url(@category, @transaction)
    assert_response :success
  end

  test 'should update transaction' do
    patch category_transaction_url(@category, @transaction),
          params: { transaction: { title: 'Updated Transaction', amount: 20.0 } }
    assert_redirected_to category_transaction_url(@category, @transaction)
    assert_equal 'Transaction was successfully updated.', flash[:notice]
  end

  test 'should destroy transaction' do
    assert_difference('Transaction.count', -1) do
      delete category_transaction_url(@category, @transaction)
    end

    assert_redirected_to category_transactions_url(@category)
    assert_equal 'Transaction was successfully deleted.', flash[:notice]
  end
end
