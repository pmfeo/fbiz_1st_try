-- Companies table (no changes, it's our main reference table)
CREATE TABLE companies (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    ticker VARCHAR(10) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    sector VARCHAR(100),
    industry VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Financial Statements table
CREATE TABLE financial_statements (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    statement_type VARCHAR(20) NOT NULL, -- 'income', 'balance', 'cash_flow'
    fiscal_year INT NOT NULL,
    fiscal_quarter INT NOT NULL,
    data JSONB NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(company_id, statement_type, fiscal_year, fiscal_quarter),
    CONSTRAINT fk_financial_statements_company
        FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE
);

-- Financial Ratios table
CREATE TABLE financial_ratios (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    date DATE NOT NULL,
    pe_ratio DECIMAL,
    pb_ratio DECIMAL,
    debt_to_equity DECIMAL,
    current_ratio DECIMAL,
    quick_ratio DECIMAL,
    roa DECIMAL,
    roe DECIMAL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(company_id, date),
    CONSTRAINT fk_financial_ratios_company
        FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE
);

-- Market Data table
CREATE TABLE market_data (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    date DATE NOT NULL,
    open DECIMAL NOT NULL,
    high DECIMAL NOT NULL,
    low DECIMAL NOT NULL,
    close DECIMAL NOT NULL,
    volume BIGINT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(company_id, date),
    CONSTRAINT fk_market_data_company
        FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE
);

-- Technical Indicators table
CREATE TABLE technical_indicators (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    company_id UUID NOT NULL,
    date DATE NOT NULL,
    rsi DECIMAL,
    stochastic_k DECIMAL,
    stochastic_d DECIMAL,
    sma_50 DECIMAL,
    sma_200 DECIMAL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(company_id, date),
    CONSTRAINT fk_technical_indicators_company
        FOREIGN KEY (company_id)
        REFERENCES companies(id)
        ON DELETE CASCADE
);

-- Market Sentiment table (no foreign key as it's market-wide)
CREATE TABLE market_sentiment (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    date DATE NOT NULL,
    overall_mood DECIMAL, -- Scale from -1 to 1
    volume_indicator DECIMAL,
    trend_strength DECIMAL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(date)
);

-- Create indexes for better query performance
CREATE INDEX idx_companies_ticker ON companies(ticker);
CREATE INDEX idx_financial_statements_company ON financial_statements(company_id);
CREATE INDEX idx_financial_ratios_company_date ON financial_ratios(company_id, date);
CREATE INDEX idx_market_data_company_date ON market_data(company_id, date);
CREATE INDEX idx_technical_indicators_company_date ON technical_indicators(company_id, date);
CREATE INDEX idx_market_sentiment_date ON market_sentiment(date);