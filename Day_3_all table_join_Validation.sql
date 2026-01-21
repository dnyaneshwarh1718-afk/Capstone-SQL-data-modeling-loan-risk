# 30) Join loan + account (basic)
 select
	l.loan_id,
    l.account_id,
    l.amount,
    l.date as Loan_date,
    l.duration,
    l.payments,
    l.status,
    a.frequency,
    a.date Account_date,
    a.district_id
 from loan l
 left join account a
 on l.account_id = a.account_id;
 
# 31) Join loan + disposition (get client info)
select
	l.loan_id,
    l.account_id,
    d.client_id,
    d.disp_id,
    d.type as Disp_type
from loan l
left join disp d
on l.account_id = d.account_id;

# 32) Join loan + client
select * from loan;
select * from disp;
select * from client;

select 
	l.loan_id,
    l.account_id,
    d.client_id,
    c.birth_number
from loan l
left join disp d
on l.account_id = d.account_id
left join client c
on d.client_id = c.client_id;
    
# 33) Join loan + district (salary/unemployment features)
select * from loan;
select * from client;
select * from disp;

select 
	l.loan_id,
    l.account_id,
    a.district_id,
    d.a2 as District_name,
    d.a11 as Avg_Salary,
    d.a12 as Unemploymen_rate_in_1995,
    d.a13 as Unemploymen_rate_in_1996,
    coalesce(round((d.a12 + d.a13) / 2,2),0) as avg_Unemploymen_rate
from loan l
left join account a
on l.account_id = a.account_id
left join district d
on a.district_id = d.a1;

# 34) Default rate by district
select 
	d.a2 as District_Name,
    count(*) as Total_count,
    sum(case when l.status in ('B','D') then 1 else 0 end) default_loan,
    round(sum(case when l.status in ('B','D') then 1 else 0 end) / count(*) *100,2) as default_rate_pct
from loan l
left join account a
on l.account_id = a.account_id
left join district d
on d.a1 = a.district_id
group by d.a2;

# 35) Default rate by client gender
select 
	case
		when (substring(c.birth_number, 3, 2) + 0) > 50 then 'F'
        else 'M'
        -- for men : the value use std date format(YYMMDD) 
        -- but for women: the value is modified by adding 50 to the month digit(YY(MM+50)DD)
	end as gender,
    count(distinct l.loan_id) as total_loan,
    sum(case when l.status in ('B','D') then 1 else 0 end) default_loan,
    round(sum(case when l.status in ('B','D') then 1 else 0 end) / count(*) *100,2) as default_rate_pct
from loan l
left join disp d
on l.account_id = d.account_id
left join client c
on d.client_id = c.client_id
where d.type = 'OWNER'
group by gender
order by default_rate_pct desc; 
 
# 36) Avg loan amount by district salary group (CASE salary bucket)

# 37) Check duplicates in loan_id

# 38) Missing account_id in loan (orphans)

# 39) Missing district in accounts

# 40) Check impossible values (loan_amount <= 0, duration <= 0)

# 41) Status distribution check again (sanity)

# 42) Validate join keys (account_id link rate)




