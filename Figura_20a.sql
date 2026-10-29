Vtotal < 50 km/s
SELECT p.source_id, p.color, p.mg,
       p.ra, p.dec, p.l, p.b,
       SQRT(POWER(p.vr_gc,2)
           +POWER(p.vphi-240,2)
           +POWER(p.vz_gc,2)) AS vtot
FROM (
    SELECT s.source_id, s.color, s.mg,
           s.ra, s.dec, s.l, s.b,
           (s.xg*(-s.u-11.1)+s.yg*(s.v+252.24))
           /SQRT(POWER(s.xg,2)+POWER(s.yg,2)) AS vr_gc,
           (-s.yg*(-s.u-11.1)+s.xg*(s.v+252.24))
           /SQRT(POWER(s.xg,2)+POWER(s.yg,2)) AS vphi,
           s.w+7.25 AS vz_gc
    FROM (
        SELECT h.source_id, h.color, h.mg,
               h.ra, h.dec, h.l, h.b,
               -0.05487556041622*h.vx
               -0.87343709023489*h.vy
               -0.48383501554871*h.vz AS u,
               0.49410942787558*h.vx
               -0.44482962996001*h.vy
               +0.74698224449722*h.vz AS v,
               -0.86766614901900*h.vx
               -0.19807637343120*h.vy
               +0.45598377617507*h.vz AS w,
               8.34-COS(RADIANS(h.b))*COS(RADIANS(h.l))
               /h.parallax AS xg,
               COS(RADIANS(h.b))*SIN(RADIANS(h.l))
               /h.parallax AS yg
        FROM (
            SELECT g.source_id, g.ra, g.dec,
                   g.l, g.b, g.parallax,
                   g.bp_rp AS color,
                   g.phot_g_mean_mag
                   +5*LOG10(g.parallax)-10 AS mg,
                   g.radial_velocity*COS(RADIANS(g.dec))
                   *COS(RADIANS(g.ra))
                   +4.74047/g.parallax*
                   (-g.pmra*SIN(RADIANS(g.ra))
                   -g.pmdec*SIN(RADIANS(g.dec))
                   *COS(RADIANS(g.ra))) AS vx,
                   g.radial_velocity*COS(RADIANS(g.dec))
                   *SIN(RADIANS(g.ra))
                   +4.74047/g.parallax*
                   (g.pmra*COS(RADIANS(g.ra))
                   -g.pmdec*SIN(RADIANS(g.dec))
                   *SIN(RADIANS(g.ra))) AS vy,
                   g.radial_velocity*SIN(RADIANS(g.dec))
                   +4.74047/g.parallax*g.pmdec
                   *COS(RADIANS(g.dec)) AS vz
            FROM gaiadr2.gaia_source AS g
            WHERE g.radial_velocity IS NOT NULL
              AND g.parallax_over_error>10
              AND g.parallax>1.0
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
                      1.0,EXP(-0.4*
                      (g.phot_g_mean_mag-19.5)))
        ) AS h
    ) AS s
) AS p
WHERE POWER(p.vr_gc,2)
    +POWER(p.vphi-240,2)
    +POWER(p.vz_gc,2)<2500

!70 < Vtotal < 180 km/s!
SELECT p.source_id, p.color, p.mg,
       p.ra, p.dec, p.l, p.b,
       SQRT(POWER(p.vr_gc,2)
           +POWER(p.vphi-240,2)
           +POWER(p.vz_gc,2)) AS vtot
FROM (
    SELECT s.source_id, s.color, s.mg,
           s.ra, s.dec, s.l, s.b,
           (s.xg*(-s.u-11.1)+s.yg*(s.v+252.24))
           /SQRT(POWER(s.xg,2)+POWER(s.yg,2)) AS vr_gc,
           (-s.yg*(-s.u-11.1)+s.xg*(s.v+252.24))
           /SQRT(POWER(s.xg,2)+POWER(s.yg,2)) AS vphi,
           s.w+7.25 AS vz_gc
    FROM (
        SELECT h.source_id, h.color, h.mg,
               h.ra, h.dec, h.l, h.b,
               -0.05487556041622*h.vx
               -0.87343709023489*h.vy
               -0.48383501554871*h.vz AS u,
               0.49410942787558*h.vx
               -0.44482962996001*h.vy
               +0.74698224449722*h.vz AS v,
               -0.86766614901900*h.vx
               -0.19807637343120*h.vy
               +0.45598377617507*h.vz AS w,
               8.34-COS(RADIANS(h.b))*COS(RADIANS(h.l))
               /h.parallax AS xg,
               COS(RADIANS(h.b))*SIN(RADIANS(h.l))
               /h.parallax AS yg
        FROM (
            SELECT g.source_id, g.ra, g.dec,
                   g.l, g.b, g.parallax,
                   g.bp_rp AS color,
                   g.phot_g_mean_mag
                   +5*LOG10(g.parallax)-10 AS mg,
                   g.radial_velocity*COS(RADIANS(g.dec))
                   *COS(RADIANS(g.ra))
                   +4.74047/g.parallax*
                   (-g.pmra*SIN(RADIANS(g.ra))
                   -g.pmdec*SIN(RADIANS(g.dec))
                   *COS(RADIANS(g.ra))) AS vx,
                   g.radial_velocity*COS(RADIANS(g.dec))
                   *SIN(RADIANS(g.ra))
                   +4.74047/g.parallax*
                   (g.pmra*COS(RADIANS(g.ra))
                   -g.pmdec*SIN(RADIANS(g.dec))
                   *SIN(RADIANS(g.ra))) AS vy,
                   g.radial_velocity*SIN(RADIANS(g.dec))
                   +4.74047/g.parallax*g.pmdec
                   *COS(RADIANS(g.dec)) AS vz
            FROM gaiadr2.gaia_source AS g
            WHERE g.radial_velocity IS NOT NULL
              AND g.parallax_over_error>10
              AND g.parallax>1.0
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
                      1.0,EXP(-0.4*
                      (g.phot_g_mean_mag-19.5)))
        ) AS h
    ) AS s
) AS p
WHERE POWER(p.vr_gc,2)
    +POWER(p.vphi-240,2)
    +POWER(p.vz_gc,2)>4900
  AND POWER(p.vr_gc,2)
    +POWER(p.vphi-240,2)
    +POWER(p.vz_gc,2)<32400
  
!Vtotal > 200 km/s!
SELECT p.source_id, p.color, p.mg,
       p.ra, p.dec, p.l, p.b,
       SQRT(POWER(p.vr_gc,2)
           +POWER(p.vphi-240,2)
           +POWER(p.vz_gc,2)) AS vtot
FROM (
    SELECT s.source_id, s.color, s.mg,
           s.ra, s.dec, s.l, s.b,
           (s.xg*(-s.u-11.1)+s.yg*(s.v+252.24))
           /SQRT(POWER(s.xg,2)+POWER(s.yg,2)) AS vr_gc,
           (-s.yg*(-s.u-11.1)+s.xg*(s.v+252.24))
           /SQRT(POWER(s.xg,2)+POWER(s.yg,2)) AS vphi,
           s.w+7.25 AS vz_gc
    FROM (
        SELECT h.source_id, h.color, h.mg,
               h.ra, h.dec, h.l, h.b,
               -0.05487556041622*h.vx
               -0.87343709023489*h.vy
               -0.48383501554871*h.vz AS u,
               0.49410942787558*h.vx
               -0.44482962996001*h.vy
               +0.74698224449722*h.vz AS v,
               -0.86766614901900*h.vx
               -0.19807637343120*h.vy
               +0.45598377617507*h.vz AS w,
               8.34-COS(RADIANS(h.b))*COS(RADIANS(h.l))
               /h.parallax AS xg,
               COS(RADIANS(h.b))*SIN(RADIANS(h.l))
               /h.parallax AS yg
        FROM (
            SELECT g.source_id, g.ra, g.dec,
                   g.l, g.b, g.parallax,
                   g.bp_rp AS color,
                   g.phot_g_mean_mag
                   +5*LOG10(g.parallax)-10 AS mg,
                   g.radial_velocity*COS(RADIANS(g.dec))
                   *COS(RADIANS(g.ra))
                   +4.74047/g.parallax*
                   (-g.pmra*SIN(RADIANS(g.ra))
                   -g.pmdec*SIN(RADIANS(g.dec))
                   *COS(RADIANS(g.ra))) AS vx,
                   g.radial_velocity*COS(RADIANS(g.dec))
                   *SIN(RADIANS(g.ra))
                   +4.74047/g.parallax*
                   (g.pmra*COS(RADIANS(g.ra))
                   -g.pmdec*SIN(RADIANS(g.dec))
                   *SIN(RADIANS(g.ra))) AS vy,
                   g.radial_velocity*SIN(RADIANS(g.dec))
                   +4.74047/g.parallax*g.pmdec
                   *COS(RADIANS(g.dec)) AS vz
            FROM gaiadr2.gaia_source AS g
            WHERE g.radial_velocity IS NOT NULL
              AND g.parallax_over_error>10
              AND g.parallax>1.0
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
                      1.0,EXP(-0.4*
                      (g.phot_g_mean_mag-19.5)))
        ) AS h
    ) AS s
) AS p
WHERE POWER(p.vr_gc,2)
    +POWER(p.vphi-240,2)
    +POWER(p.vz_gc,2)>40000
