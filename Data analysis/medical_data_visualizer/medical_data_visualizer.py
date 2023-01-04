import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

df = pd.read_csv("medical_examination.csv")

df["overweight"] = (df["weight"] / (df["height"] / 100) ** 2).apply(lambda x: 1 if x > 25 else 0)
df["cholesterol"] = df["cholesterol"].apply(lambda x: 0 if x == 1 else 1)
df["gluc"] = df["gluc"].apply(lambda x: 0 if x == 1 else 1)

def draw_cat_plot():
    df_cat = pd.melt(df, id_vars="cardio", value_vars=["cholesterol", "gluc", "alco", "active", "smoke"],
                     var_name="variable")

    df_cat = pd.melt(df, id_vars="cardio", value_vars=["active", "alco", "cholesterol", "gluc", "smoke"],
                     var_name="variable")

    fig = sns.catplot(df_cat, x="variable", kind="count", hue="value", col="cardio").set_axis_labels("variable", "total")

    fig.savefig('catplot.png')
    return fig

def draw_heat_map():
    # Clean the data
    df_heat = df[(df['ap_lo']<=df['ap_hi']) &
    (df['height'] >= df['height'].quantile(0.025))&
    (df['height'] <= df['height'].quantile(0.975))&
    (df['weight'] >= df['weight'].quantile(0.025))&
    (df['weight'] <= df['weight'].quantile(0.975))
    ]

    # Calculate the correlation matrix
    corr = df_heat.corr()

    # Generate a mask for the upper triangle
    mask = np.triu(corr)

    # Set up the matplotlib figure
    fig, ax = plt.subplots(figsize=(7, 5))

    # Draw the heatmap with 'sns.heatmap()'
    sns.heatmap(corr,mask=mask, fmt='.1f',vmax=.3, linewidths=.5,square=True, cbar_kws = {'shrink':0.5},annot=True, center=0)

    fig.savefig('heatmap.png')
    return fig


if __name__ == "__main__":
    draw_cat_plot()
    draw_heat_map()