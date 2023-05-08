view: prediction {
  parameter: transactions_amount{type: number}
  parameter: transaction_hour{type: number}
  parameter: transaction_distance{type: number}


  derived_table: {
    sql:
    SELECT * FROM ML.PREDICT(MODEL `retail_banking.fraud_prediction`,
    (SELECT {% transactions_amount %} AS card_transactions_amount,
            {% transaction_hour %} AS card_transactions_transaction_hour_of_day,
            {% transaction_distance %} AS card_transactions_transaction_distance));;
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
