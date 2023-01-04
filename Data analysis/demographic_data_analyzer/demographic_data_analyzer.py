import pandas as pd
import numpy as np


def calculate_demographic_data(print_data=True):
    df = pd.read_csv('adult.data.csv')

    race_count = dict()
    for x in df['race']:
        if x in race_count.keys():
            race_count[x] += 1
        else:
            race_count[x] = 1
    race_count = pd.Series(race_count)

    men_age = sum(df.loc[df['sex'].eq('Male'), 'age'])
    average_age_men = np.round(men_age / sum(df['sex'].eq('Male')), 1)

    percentage_bachelors = np.round(sum(df['education'] == 'Bachelors')
                                    * 100 / df.last_valid_index(), 1)

    hight_educate_list = ["Bachelors", "Masters", "Doctorate"]

    higher_education = df.loc[df['education'].isin(hight_educate_list)]
    lower_education = df.loc[~df['education'].isin(hight_educate_list)]

    hight_salary_level_amount_person_of_he = 0
    hight_salary_level_amount_person_of_le = 0
    for salary_he in higher_education['salary']:
      if salary_he == '>50K':
          hight_salary_level_amount_person_of_he += 1
    for salary_le in lower_education['salary']:
      if salary_le == '>50K':
          hight_salary_level_amount_person_of_le += 1

    higher_education_rich = np.round(hight_salary_level_amount_person_of_he
                                     * 100 / len(higher_education), 1)
    lower_education_rich = np.round(hight_salary_level_amount_person_of_le
                                     * 100 / len(lower_education), 1)

    min_work_hours = np.min(df['hours-per-week'])

    num_min_workers = df[df['hours-per-week'] == 1]

    rich_percentage = (np.sum(num_min_workers['salary'] == '>50K') * 100
                       // len(num_min_workers))

    all_country = df['native-country'].value_counts()
    highest_earning_country = ''
    highest_earning_country_percentage = 0
    for current_country, population in all_country.items():
      current_cinfo = df.loc[df['native-country'] == current_country]
      current_earning_per = np.round(np.sum(current_cinfo['salary'] == '>50K')
                                    * 100 / population, 1)
      if current_earning_per > highest_earning_country_percentage:
          highest_earning_country_percentage = current_earning_per
          highest_earning_country = current_country

    top_IN_occupation = df['occupation'].value_counts().first_valid_index()


    if print_data:
        print("Number of each race:\n", race_count) 
        print("Average age of men:", average_age_men)
        print(f"Percentage with Bachelors degrees: {percentage_bachelors}%")
        print(f"Percentage with higher education that earn >50K: {higher_education_rich}%")
        print(f"Percentage without higher education that earn >50K: {lower_education_rich}%")
        print(f"Min work time: {min_work_hours} hours/week")
        print(f"Percentage of rich among those who work fewest hours: {rich_percentage}%")
        print("Country with highest percentage of rich:", highest_earning_country)
        print(f"Highest percentage of rich people in country: {highest_earning_country_percentage}%")
        print("Top occupations in India:", top_IN_occupation)

    return {
        'race_count': race_count,
        'average_age_men': average_age_men,
        'percentage_bachelors': percentage_bachelors,
        'higher_education_rich': higher_education_rich,
        'lower_education_rich': lower_education_rich,
        'min_work_hours': min_work_hours,
        'rich_percentage': rich_percentage,
        'highest_earning_country': highest_earning_country,
        'highest_earning_country_percentage':
        highest_earning_country_percentage,
        'top_IN_occupation': top_IN_occupation
    }
