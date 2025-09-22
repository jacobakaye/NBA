# scripts/fetch_nba_stats.R
Sys.setenv(HOOPR_USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0 Safari/537.36")
library(hoopR)
library(dplyr)
library(readr)

dir.create("data", showWarnings = FALSE)

this_season <- year_to_season(most_recent_nba_season() - 1)

# Safe wrapper for API calls
safe_fetch <- function(fun, path, ...) {
  out <- tryCatch(
    fun(...),
    error = function(e) {
      message("⚠️ Error fetching ", path, ": ", e$message)
      return(NULL)
    }
  )
  
  if (is.null(out)) {
    message("⚠️ Skipped (NULL): ", path)
    return(invisible(NULL))
  }
  
  # If it's a list of data.frames, keep the first one
  if (is.list(out) && !inherits(out, "data.frame")) {
    if (all(vapply(out, inherits, logical(1), "data.frame"))) {
      out <- out[[1]]
    } else {
      message("⚠️ Skipped (not a data.frame): ", path)
      return(invisible(NULL))
    }
  }
  
  if (inherits(out, "data.frame") && nrow(out) > 0) {
    write_csv(out, path)
    message("✅ Saved: ", path)
  } else {
    message("⚠️ Skipped (empty or invalid): ", path)
  }
}

# Calls
safe_fetch(nba_leagueleaders, "data/nba_leagueleaders.csv",
           league_id = "00", per_mode = "PerGame")

safe_fetch(nba_leaguedashlineups, "data/nba_lineups.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashplayerclutch, "data/nba_player_clutch.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashplayerptshot, "data/nba_player_pt_shot.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashoppptshot, "data/nba_opp_pt_shot.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashplayershotlocations, "data/nba_player_shot_locations.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashplayerstats, "data/nba_player_stats.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashptdefend, "data/nba_pt_defend.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashptstats, "data/nba_pt_stats.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashptteamdefend, "data/nba_pt_team_defend.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashteamclutch, "data/nba_team_clutch.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashteamptshot, "data/nba_team_pt_shot.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashteamshotlocations, "data/nba_team_shot_locations.csv",
           league_id = "00", season = this_season)

safe_fetch(nba_leaguedashteamstats, "data/nba_team_stats.csv",
           league_id = "00", per_mode = "PerGame", season = this_season)
