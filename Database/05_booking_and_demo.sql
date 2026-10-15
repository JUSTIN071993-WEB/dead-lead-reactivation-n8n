-- 05: Booking guard and demo-lead flag

-- Two leads can never hold the same consultation slot, even if two
-- conversations try to book it at the same moment.
CREATE UNIQUE INDEX IF NOT EXISTS bookings_slot_uq
ON bookings (starts_at) WHERE status = 'scheduled';

-- Only leads flagged is_demo can be reached through the public demo endpoints.
ALTER TABLE leads ADD COLUMN IF NOT EXISTS is_demo boolean NOT NULL DEFAULT false;

-- Mark one lead per segment as a demo lead (add your own test leads by id if you like).
UPDATE leads SET is_demo = true
WHERE id IN (
  SELECT DISTINCT ON (segment) id
  FROM leads
  WHERE segment IS NOT NULL AND NOT opted_out
  ORDER BY segment, est_value DESC NULLS LAST
);
