/**
 * I am the User Service V2
 */
component singleton accessors="true" {

	/**
	 * Constructor
	 */
	UserService function init(){
		return this;
	}

	function get( required numeric userID ){
		return queryExecute(
			"select * from users
			where id = :userID",
			{
				userID : {
					value : "#userID#",
					type  : "cf_sql_numeric"
				}
			}
		).reduce( ( result, row ) => {
			result.append( row );
			return result;
		}, [] );
	}

	boolean function exists( required numeric userID ){
		return booleanFormat(
			queryExecute(
				"select id from users
				where id = :userID",
				{
					userID : {
						value : "#userID#",
						type  : "cf_sql_numeric"
					}
				},
				{ returntype : "array" }
			).len()
		)
	}

}
