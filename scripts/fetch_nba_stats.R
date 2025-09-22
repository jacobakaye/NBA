# scripts/fetch_nba_stats.R
library(hoopR)
library(dplyr)
library(readr)

dir.create("data", showWarnings = FALSE)

this_season <- year_to_season(most_recent_nba_season() - 1)

# Safer save function
save_csv <- function(obj, path) {
  if (!is.null(obj) && inherits(obj, "data.frame") && nrow(obj) > 0) {
    write_csv(obj, path)
    message("✅ Saved: ", path)
  } else {
    message("⚠️ Skipped (not a data.frame): ", path)
  }
}

# Calls
save_csv(nba_leagueleaders(league_id = "00", per_mode = "PerGame"),
         "data/nba_leagueleaders.csv")

save_csv(nba_leaguedashlineups(league_id = "00", season = this_season),
         "data/nba_lineups.csv")

save_csv(nba_leaguedashplayerclutch(league_id = "00", season = this_season),
         "data/nba_player_clutch.csv")

save_csv(nba_leaguedashplayerptshot(league_id = "00", season = this_season),
         "data/nba_player_pt_shot.csv")

save_csv(nba_leaguedashoppptshot(league_id = "00", season = this_season),
         "data/nba_opp_pt_shot.csv")

save_csv(nba_leaguedashplayershotlocations(league_id = "00", season = this_season),
         "data/nba_player_shot_locations.csv")

save_csv(nba_leaguedashplayerstats(league_id = "00", season = this_season),
         "data/nba_player_stats.csv")

save_csv(nba_leaguedashptdefend(league_id = "00", season = this_season),
         "data/nba_pt_defend.csv")

save_csv(nba_leaguedashptstats(league_id = "00", season = this_season),
         "data/nba_pt_stats.csv")

save_csv(nba_leaguedashptteamdefend(league_id = "00", season = this_season),
         "data/nba_pt_team_defend.csv")

save_csv(nba_leaguedashteamclutch(league_id = "00", season = this_season),
         "data/nba_team_clutch.csv")

save_csv(nba_leaguedashteamptshot(league_id = "00", season = this_season),
         "data/nba_team_pt_shot.csv")

save_csv(nba_leaguedashteamshotlocations(league_id = "00", season = this_season),
         "data/nba_team_shot_locations.csv")

save_csv(nba_leaguedashteamstats(league_id = "00", per_mode = "PerGame", season = this_season),
         "data/nba_team_stats.csv")
