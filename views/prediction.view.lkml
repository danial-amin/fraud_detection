view: prediction {
  parameter: transactionsamount{type: number}
  parameter: transactionhour{type: number}
  parameter: transactiondistance{type: number}


derived_table: {
    sql:
    SELECT * FROM ML.PREDICT(MODEL `polish-bankruptcy.retail_banking.fraud_prediction`,
    (SELECT {% parameter transactionsamount %} AS card_transactions_amount,
            {% parameter transactionhour %} AS card_transactions_transaction_hour_of_day,
            {% parameter transactiondistance %} AS card_transactions_transaction_distance));;
  }
  dimension: predict_prob {
    type: number
    sql: ${TABLE}.predicted_isfraud_probs[1][1] ;;
  }

  dimension: other_prob {
    type: number
    sql: ${TABLE}.predicted_isfraud_probs[0][1] ;;
  }

  dimension: trans_amount {
    type: number
    sql: ${TABLE}.card_transactions_amount ;;
  }
  dimension: trans_hour {
    type: number
    sql: ${TABLE}.card_transactions_transaction_hour_of_day ;;
  }
  dimension: trans_distance {
    type: number
    sql: ${TABLE}.card_transactions_transaction_distance ;;
  }
}
