defmodule Auctane.ShipEngineData.Carriers.Schema.Carrier do
  @moduledoc "A Struct representing basic, non-associative carrier data"

  defstruct carrier_id: nil,
            carrier_code: nil,
            account_number: nil,
            requires_funded_amount: nil,
            balance: nil,
            nickname: nil,
            friendly_name: nil

  @type t() :: %__MODULE__{
          carrier_id: String.t(),
          carrier_code: String.t(),
          account_number: String.t(),
          requires_funded_amount: bool(),
          carrier_code: String.t(),
          balance: number(),
          nickname: String.t(),
          friendly_name: String.t()
        }
end
