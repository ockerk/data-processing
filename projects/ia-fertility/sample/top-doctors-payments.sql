SELECT Physician_First_Name,Physician_Middle_Name,Physician_Last_Name,Recipient_Primary_Business_Street_Address_Line1,Recipient_Primary_Business_Street_Address_Line2,Recipient_City,Recipient_Zip_Code,Physician_Primary_Type,Physician_Specialty,Physician_Profile_ID,Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_Name,Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_State,Applicable_Manufacturer_or_Applicable_GPO_Making_Payment_ID,Total_Amount_of_Payment_USDollars,Date_of_Payment,Category
FROM data
WHERE Physician_Profile_ID IN (
	SELECT Physician_Profile_ID
	FROM data
	WHERE Physician_Profile_ID > 0
	GROUP BY Physician_Profile_ID
	ORDER BY SUM( CAST(Total_Amount_of_Payment_USDollars AS REAL) ) DESC
	LIMIT 100
)
ORDER BY Physician_Profile_ID DESC;