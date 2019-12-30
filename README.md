# R-Custom-Function
Custom built functions

## ZWins.r
This function use below custom logic to winsorize data (up to 100 iterations)

#### Parameters:
	data     - vector raw data
	sigCheck - used to check whether Z Score of raw data is out side of this check threshold;
	sigAdj   - used to adjust outliers

#### Algorithm:
	1. Set Iteration =1;
	2. Compute z-scores (cross-sectional) for all the raw ratios in the base universe selected
	    2.1. If All |z-score| < 5, use this z-score as the final result. Stop iterative process.
	    2.1. If Any |z-score| >= 5, then flag any instance that has a z-score > |3| as outlier 
	3. Compute a new_mean and new_stdev of raw ratios from #1 that are not flagged as outliers (having a z-score with z-scores <= |3|)
	4. For any raw ratios that,
	    raw ratios > (new_mean + 3*new_stdev), then replace it with new_mean + 3*new_stdev
      raw ratios < (new_mean - 3*new_stdev), then replace it with new_mean - 3*new_stdev
	5. Iteration = Iteration + 1;
	6. Repeat steps 2 to 5. End process at 2.1 or until Iteration = 4, whichever is earliest.

## NoNeg.r
This function checks all values and transform all negative values to 0. This is useful when certain derived fundemental finanical metrics (e.g. sales, receivables) are negative due to missed reporting or restatements. They should be treated as 0 in certain aggregation.

#### Parameters:
	data 	- vector for NoNeg; data frame for NoNeg.df

### Algorithm:
	simply check whether value is negative, if so change it o 0, otherwise leave the original value
