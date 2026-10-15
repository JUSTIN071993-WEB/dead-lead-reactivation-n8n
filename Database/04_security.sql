-- 04: Lock the tables down (Row Level Security) and make the views respect it.
-- n8n connects as the database owner, so it is not affected.
ALTER TABLE leads             ENABLE ROW LEVEL SECURITY;
ALTER TABLE leads_staging     ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages          ENABLE ROW LEVEL SECURITY;
ALTER TABLE bookings          ENABLE ROW LEVEL SECURITY;
ALTER TABLE lead_events       ENABLE ROW LEVEL SECURITY;
ALTER TABLE segment_playbook  ENABLE ROW LEVEL SECURITY;
ALTER TABLE campaign_settings ENABLE ROW LEVEL SECURITY;

ALTER VIEW v_segment_summary SET (security_invoker = true);
ALTER VIEW v_campaign_funnel SET (security_invoker = true);
