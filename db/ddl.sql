CREATE TABLE stripe_payment_methods (
  id serial unique,
  kb_payment_method_id varchar(255) DEFAULT NULL,
  token varchar(255) DEFAULT NULL,
  stripe_customer_id varchar(255) DEFAULT NULL,
  cc_first_name varchar(255) DEFAULT NULL,
  cc_last_name varchar(255) DEFAULT NULL,
  cc_type varchar(255) DEFAULT NULL,
  cc_exp_month varchar(255) DEFAULT NULL,
  cc_exp_year varchar(255) DEFAULT NULL,
  cc_number varchar(255) DEFAULT NULL,
  cc_last_4 varchar(255) DEFAULT NULL,
  cc_start_month varchar(255) DEFAULT NULL,
  cc_start_year varchar(255) DEFAULT NULL,
  cc_issue_number varchar(255) DEFAULT NULL,
  cc_verification_value varchar(255) DEFAULT NULL,
  cc_track_data varchar(255) DEFAULT NULL,
  address1 varchar(255) DEFAULT NULL,
  address2 varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  state varchar(255) DEFAULT NULL,
  zip varchar(255) DEFAULT NULL,
  country varchar(255) DEFAULT NULL,
  is_deleted boolean NOT NULL DEFAULT '0',
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL,
  kb_account_id varchar(255) DEFAULT NULL,
  kb_tenant_id varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) /*! ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_bin */;
CREATE INDEX index_stripe_payment_methods_kb_account_id ON stripe_payment_methods(kb_account_id);
CREATE INDEX index_stripe_payment_methods_kb_payment_method_id ON stripe_payment_methods(kb_payment_method_id);

CREATE TABLE stripe_transactions (
  id serial unique,
  stripe_response_id bigint /*! unsigned */ NOT NULL,
  api_call varchar(255) NOT NULL,
  kb_payment_id varchar(255) NOT NULL,
  kb_payment_transaction_id varchar(255) NOT NULL,
  transaction_type varchar(255) NOT NULL,
  payment_processor_account_id varchar(255) DEFAULT NULL,
  txn_id varchar(255) DEFAULT NULL,
  amount_in_cents int DEFAULT NULL,
  currency varchar(255) DEFAULT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL,
  kb_account_id varchar(255) NOT NULL,
  kb_tenant_id varchar(255) NOT NULL,
  PRIMARY KEY (id)
) /*! ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_bin */;
CREATE INDEX index_stripe_transactions_kb_payment_id ON stripe_transactions(kb_payment_id);
CREATE INDEX index_stripe_transactions_stripe_response_id ON stripe_transactions(stripe_response_id);

CREATE TABLE stripe_responses (
  id serial unique,
  api_call varchar(255) NOT NULL,
  kb_payment_id varchar(255) DEFAULT NULL,
  kb_payment_transaction_id varchar(255) DEFAULT NULL,
  transaction_type varchar(255) DEFAULT NULL,
  payment_processor_account_id varchar(255) DEFAULT NULL,
  message varchar(255) DEFAULT NULL,
  authorisation varchar(255) DEFAULT NULL,
  fraud_review boolean DEFAULT NULL,
  test boolean DEFAULT NULL,
  params_id varchar(255) DEFAULT NULL,
  params_object varchar(255) DEFAULT NULL,
  params_created varchar(255) DEFAULT NULL,
  params_livemode varchar(255) DEFAULT NULL,
  params_paid varchar(255) DEFAULT NULL,
  params_amount varchar(255) DEFAULT NULL,
  params_currency varchar(255) DEFAULT NULL,
  params_refunded varchar(255) DEFAULT NULL,
  params_card_id varchar(255) DEFAULT NULL,
  params_card_object varchar(255) DEFAULT NULL,
  params_card_last4 varchar(255) DEFAULT NULL,
  params_card_type varchar(255) DEFAULT NULL,
  params_card_exp_month varchar(255) DEFAULT NULL,
  params_card_exp_year varchar(255) DEFAULT NULL,
  params_card_fingerprint varchar(255) DEFAULT NULL,
  params_card_customer varchar(255) DEFAULT NULL,
  params_card_country varchar(255) DEFAULT NULL,
  params_card_name varchar(255) DEFAULT NULL,
  params_card_address_line1 varchar(255) DEFAULT NULL,
  params_card_address_line2 varchar(255) DEFAULT NULL,
  params_card_address_city varchar(255) DEFAULT NULL,
  params_card_address_state varchar(255) DEFAULT NULL,
  params_card_address_zip varchar(255) DEFAULT NULL,
  params_card_address_country varchar(255) DEFAULT NULL,
  params_card_cvc_check varchar(255) DEFAULT NULL,
  params_card_address_line1_check varchar(255) DEFAULT NULL,
  params_card_address_zip_check varchar(255) DEFAULT NULL,
  params_captured varchar(255) DEFAULT NULL,
  params_refunds text DEFAULT NULL,
  params_balance_transaction varchar(255) DEFAULT NULL,
  params_failure_message varchar(255) DEFAULT NULL,
  params_failure_code varchar(255) DEFAULT NULL,
  params_amount_refunded varchar(255) DEFAULT NULL,
  params_customer varchar(255) DEFAULT NULL,
  params_email varchar(255) DEFAULT NULL,
  params_delinquent varchar(255) DEFAULT NULL,
  params_subscription varchar(255) DEFAULT NULL,
  params_discount varchar(255) DEFAULT NULL,
  params_account_balance varchar(255) DEFAULT NULL,
  params_cards text DEFAULT NULL,
  params_invoice varchar(255) DEFAULT NULL,
  params_description varchar(255) DEFAULT NULL,
  params_dispute varchar(255) DEFAULT NULL,
  params_metadata varchar(255) DEFAULT NULL,
  params_error_type varchar(255) DEFAULT NULL,
  params_error_message varchar(255) DEFAULT NULL,
  avs_result_code varchar(255) DEFAULT NULL,
  avs_result_message varchar(255) DEFAULT NULL,
  avs_result_street_match varchar(255) DEFAULT NULL,
  avs_result_postal_match varchar(255) DEFAULT NULL,
  cvv_result_code varchar(255) DEFAULT NULL,
  cvv_result_message varchar(255) DEFAULT NULL,
  success boolean DEFAULT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL,
  kb_account_id varchar(255) DEFAULT NULL,
  kb_tenant_id varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) /*! ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_bin */;
CREATE INDEX index_stripe_responses_kb_payment_id_kb_tenant_id ON stripe_responses(kb_payment_id, kb_tenant_id);

CREATE TABLE stripe_application_fees (
  id serial unique,
  application_fee DECIMAL(3,2) NOT NULL,
  created_at datetime NOT NULL,
  updated_at datetime NOT NULL,
  active boolean DEFAULT NULL,
  PRIMARY KEY (id)
) /*! ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_bin */;
