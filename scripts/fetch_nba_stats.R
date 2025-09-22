# scripts/fetch_nba_stats.R
library(hoopR)
library(tidyverse)
library(dplyr)

# Create output directory
dir.create("data", showWarnings = FALSE)

# Helpers
this_season <- year_to_season(most_recent_nba_season() - 1)

# 1. League leaders (per game)
nba_leagueleaders(league_id = '00', per_mode = "PerGame") %>%
  write.csv("data/nba_leagueleaders.csv", row.names = FALSE)

# 2. Lineups
nba_leaguedashlineups(league_id = '00', season = this_season) %>%
  write.csv("data/nba_lineups.csv", row.names = FALSE)

# 3. Player clutch stats
nba_leaguedashplayerclutch(league_id = '00', season = this_season) %>%
  write.csv("data/nba_player_clutch.csv", row.names = FALSE)

# 4. Player shot type stats
nba_leaguedashplayerptshot(league_id = '00', season = this_season) %>%
  write.csv("data/nba_player_pt_shot.csv", row.names = FALSE)

# 5. Opponent shot type stats
nba_leaguedashoppptshot(league_id = '00', season = this_season) %>%
  write.csv("data/nba_opp_pt_shot.csv", row.names = FALSE)

# 6. Player shot locations
nba_leaguedashplayershotlocations(league_id = '00', season = this_season) %>%
  write.csv("data/nba_player_shot_locations.csv", row.names = FALSE)

# 7. Player stats
nba_leaguedashplayerstats(league_id = '00', season = this_season) %>%
  write.csv("data/nba_player_stats.csv", row.names = FALSE)

# 8. Player defended stats
nba_leaguedashptdefend(league_id = '00', season = this_season) %>%
  write.csv("data/nba_pt_defend.csv", row.names = FALSE)

# 9. Player point stats
nba_leaguedashptstats(league_id = '00', season = this_season) %>%
  write.csv("data/nba_pt_stats.csv", row.names = FALSE)

# 10. Team defended stats
nba_leaguedashptteamdefend(league_id = '00', season = this_season) %>%
  write.csv("data/nba_pt_team_defend.csv", row.names = FALSE)

# 11. Team clutch stats
nba_leaguedashteamclutch(league_id = '00', season = this_season) %>%
  write.csv("data/nba_team_clutch.csv", row.names = FALSE)

# 12. Team shot type stats
nba_leaguedashteamptshot(league_id = '00', season = this_season) %>%
  write.csv("data/nba_team_pt_shot.csv", row.names = FALSE)

# 13. Team shot locations
nba_leaguedashteamshotlocations(league_id = '00', season = this_season) %>%
  write.csv("data/nba_team_shot_locations.csv", row.names = FALSE)

# 14. Team stats (per game)
nba_leaguedashteamstats(league_id = '00', per_mode = "PerGame", season = this_season) %>%
  write.csv("data/nba_team_stats.csv", row.names = FALSE)
