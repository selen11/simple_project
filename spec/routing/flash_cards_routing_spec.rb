require "rails_helper"

describe FlashCardsController do
  it do
    expect(get: "/").to route_to(
      controller: 'flash_cards',
      action: 'index')
  end

  it do
    expect(get: "/").not_to route_to(
      controller: 'flash_cards',
      action: 'new')
  end

  it do
    expect(post: "/").not_to route_to(
      controller: 'flash_cards',
      action: 'create')
  end

  it do
    expect(get: "/flash_cards").to route_to(
      controller: 'flash_cards',
      action: 'index')
  end

  it do
    expect(get: "/flash_cards").not_to route_to(
      controller: 'flash_cards',
      action: 'new')
  end

  it do
    expect(post: "/flash_cards").not_to route_to(
      controller: 'flash_cards',
      action: 'create')
  end
end
