#!/usr/bin/env python  
# -*- coding: utf-8 -*-

import re

from tango import db

from flask import Blueprint, request, render_template

from tango.ui import menus, Menu

from tango.ui import Dashboard, Widget, add_widget, widgets

from tango.login import login_required, current_user

from fault import Alarm

from tango.models import Profile

homeview = Blueprint('home', __name__)

def nested_dict(name, form):
    dict = {}
    pattern = "^%s\[(.+)\]$" % name
    for key in form.keys():
        m = re.match(pattern, key)
        if m:
            dict[m.group(1)] = form[key]
    return dict

@homeview.route('/dashboard')
@login_required
def dashboard():
    uid = current_user.id
    board = Dashboard(widgets)
    board.configure(Profile.load(uid))
    return render_template('/dashboard.html', dashboard = board)

@homeview.route('/dashboard/settings', methods = ['POST'])
@login_required
def setting():
    form = request.form
    uid = current_user.id
    if form['action'] == 'meta-box-order' and form['page'] == 'dashboard':
        order = nested_dict('order', form)
        layout = form['page_columns']
        Profile(uid, 'dashboard', 'dashboard.box.order', str(order)).update()
        Profile(uid, 'dashboard', 'dashboard.screen.layout', layout).update()
        db.session.commit()
    elif form['action'] == 'closed-postboxes' and form['page'] == 'dashboard':
        Profile(uid, 'dashboard', 'dashboard.closedbox', form['closed']).update()
        Profile(uid, 'dashboard', 'dashboard.metaboxhidden', form['hidden']).update()
        db.session.commit()
    elif form['action'] == 'update-welcome-panel':
        Profile(uid, 'dashboard', 'dashboard.welcome.panel', form['visible']).update()
        db.session.commit()

    return '0'

@homeview.route('/timeline')
@login_required
def timeline():
    events = get_events(current_user)
    return render_template('/timeline.html', events=events)

def get_events(user):
    nids = [node.id for node in user.nodes]
    q = Alarm.query.filter(Alarm.node_id.in_(nids))
    return q.order_by("raised_at desc").limit(50).all()

menus.append(Menu('dashboard', u'首页', '/dashboard'))

