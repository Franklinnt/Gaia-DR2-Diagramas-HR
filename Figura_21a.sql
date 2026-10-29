!Vt < 40 km/s!
SELECT g.source_id,
       g.bp_rp AS color,
       g.phot_g_mean_mag
       +5*LOG10(g.parallax)-10 AS mg,
       4.74047*SQRT(
           POWER(g.pmra,2)+POWER(g.pmdec,2)
       )/g.parallax AS vt
FROM gaiadr2.gaia_source AS g
WHERE g.parallax>0
  AND g.parallax_over_error>10
  AND ABS(g.b)>45
  AND g.phot_g_mean_flux_over_error>50
  AND g.phot_bp_mean_flux_over_error>20
  AND g.phot_rp_mean_flux_over_error>20
  AND g.phot_bp_rp_excess_factor>
      1.0+0.015*POWER(g.bp_rp,2)
  AND g.phot_bp_rp_excess_factor<
      1.3+0.06*POWER(g.bp_rp,2)
  AND g.visibility_periods_used>8
  AND g.astrometric_n_good_obs_al>5
  AND g.astrometric_chi2_al/
      (g.astrometric_n_good_obs_al-5)
      <1.44*GREATEST(
          1.0,EXP(-0.4*(g.phot_g_mean_mag-19.5)))
  AND 4.74047*SQRT(
      POWER(g.pmra,2)+POWER(g.pmdec,2)
      )/g.parallax<40

60 < Vt < 150 km/s 
SELECT g.source_id,
       g.bp_rp AS color,
       g.phot_g_mean_mag
       +5*LOG10(g.parallax)-10 AS mg,
       4.74047*SQRT(
           POWER(g.pmra,2)+POWER(g.pmdec,2)
       )/g.parallax AS vt
FROM gaiadr2.gaia_source AS g
WHERE g.parallax>0
  AND g.parallax_over_error>10
  AND ABS(g.b)>45
  AND g.phot_g_mean_flux_over_error>50
  AND g.phot_bp_mean_flux_over_error>20
  AND g.phot_rp_mean_flux_over_error>20
  AND g.phot_bp_rp_excess_factor>
      1.0+0.015*POWER(g.bp_rp,2)
  AND g.phot_bp_rp_excess_factor<
      1.3+0.06*POWER(g.bp_rp,2)
  AND g.visibility_periods_used>8
  AND g.astrometric_n_good_obs_al>5
  AND g.astrometric_chi2_al/
      (g.astrometric_n_good_obs_al-5)
      <1.44*GREATEST(
          1.0,EXP(-0.4*(g.phot_g_mean_mag-19.5)))
  AND 4.74047*SQRT(
      POWER(g.pmra,2)+POWER(g.pmdec,2)
      )/g.parallax>60
  AND 4.74047*SQRT(
      POWER(g.pmra,2)+POWER(g.pmdec,2)
      )/g.parallax<150

Vt > 200 km/s 
SELECT g.source_id,
       g.bp_rp AS color,
       g.phot_g_mean_mag
       +5*LOG10(g.parallax)-10 AS mg,
       4.74047*SQRT(
           POWER(g.pmra,2)+POWER(g.pmdec,2)
       )/g.parallax AS vt
FROM gaiadr2.gaia_source AS g
WHERE g.parallax>0
  AND g.parallax_over_error>10
  AND ABS(g.b)>45
  AND g.phot_g_mean_flux_over_error>50
  AND g.phot_bp_mean_flux_over_error>20
  AND g.phot_rp_mean_flux_over_error>20
  AND g.phot_bp_rp_excess_factor>
      1.0+0.015*POWER(g.bp_rp,2)
  AND g.phot_bp_rp_excess_factor<
      1.3+0.06*POWER(g.bp_rp,2)
  AND g.visibility_periods_used>8
  AND g.astrometric_n_good_obs_al>5
  AND g.astrometric_chi2_al/
      (g.astrometric_n_good_obs_al-5)
      <1.44*GREATEST(
          1.0,EXP(-0.4*(g.phot_g_mean_mag-19.5)))
  AND 4.74047*SQRT(
      POWER(g.pmra,2)+POWER(g.pmdec,2)
      )/g.parallax>200
