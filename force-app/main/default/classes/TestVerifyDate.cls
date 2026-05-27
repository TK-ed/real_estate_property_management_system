/**
* @File Name : TestVerifyDate.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : September 23, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | September 23, 2025 |   | Initial Version
**/
@IsTest
public class TestVerifyDate {
	@IsTest
	public static void testCheckDates_DateWithin30Days(){
		Date date1 = Date.newInstance(2023, 1, 15);
        Date date2 = Date.newInstance(2023, 1, 16);
        System.assertEquals(date2, VerifyDate.CheckDates(date1, date2), 'Should return date2 when it\'s 1 day after date1');
	}
    
    @Istest
    public static void testCheckDates_DateOutside30Days(){
        Date date1 = Date.newInstance(2023, 1, 1);
        Date date2 = Date.newInstance(2023, 1, 31); // Exactly 30 days later
        Date expectedDate = Date.newInstance(2023, 1, 31); // End of month for Jan 1
        System.assertEquals(expectedDate, VerifyDate.CheckDates(date1, date2), 'Should return end of month if date2 is exactly 30 days after date1');
        
		date1 = Date.newInstance(2023, 3, 1);
        date2 = Date.newInstance(2023, 4, 15); // More than 30 days later
        expectedDate = Date.newInstance(2023, 3, 31); // End of month for March 1
        System.assertEquals(expectedDate, VerifyDate.CheckDates(date1, date2), 'Should return end of month if date2 is more than 30 days after date1');
	}
}