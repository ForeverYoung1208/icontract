require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract = contracts(:one)
  end

  test "should get index" do
    get contracts_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_url
    assert_response :success
  end

  test "should create contract" do
    assert_difference('Contract.count') do
      post contracts_url, params: { contract: { acts_schedule: @contract.acts_schedule, creator_user_id: @contract.creator_user_id, from_date: @contract.from_date, is_active: @contract.is_active, is_deleted: @contract.is_deleted, is_signed: @contract.is_signed, name: @contract.name, number: @contract.number, payer_id: @contract.payer_id, payments_schedule: @contract.payments_schedule, recipient_id: @contract.recipient_id, responsible_user_id: @contract.responsible_user_id, scan_path: @contract.scan_path, sum: @contract.sum, text_path: @contract.text_path, till: @contract.till, to_date: @contract.to_date, type_id: @contract.type_id } }
    end

    assert_redirected_to contract_url(Contract.last)
  end

  test "should show contract" do
    get contract_url(@contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_url(@contract)
    assert_response :success
  end

  test "should update contract" do
    patch contract_url(@contract), params: { contract: { acts_schedule: @contract.acts_schedule, creator_user_id: @contract.creator_user_id, from_date: @contract.from_date, is_active: @contract.is_active, is_deleted: @contract.is_deleted, is_signed: @contract.is_signed, name: @contract.name, number: @contract.number, payer_id: @contract.payer_id, payments_schedule: @contract.payments_schedule, recipient_id: @contract.recipient_id, responsible_user_id: @contract.responsible_user_id, scan_path: @contract.scan_path, sum: @contract.sum, text_path: @contract.text_path, till: @contract.till, to_date: @contract.to_date, type_id: @contract.type_id } }
    assert_redirected_to contract_url(@contract)
  end

  test "should destroy contract" do
    assert_difference('Contract.count', -1) do
      delete contract_url(@contract)
    end

    assert_redirected_to contracts_url
  end
end
