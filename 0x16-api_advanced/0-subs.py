#!/usr/bin/python3
""" How many subs? """
import sys
import json
import requests


def number_of_subscribers(subreddit):
    """return number of subs of a subreddit"""
    response = requests.get('https://www.reddit.com/r/{}/about.json'
                            .format(subreddit),
                            headers={'User-agent': 'Mozilla/5.0'})
    data = response.json().get('data')
    return data.get('subscribers')
