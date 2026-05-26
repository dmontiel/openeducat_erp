FROM odoo:18.0

USER root

COPY ./odoo.conf /etc/odoo/odoo.conf
COPY ./docker/openeducat-entrypoint.sh /usr/local/bin/openeducat-entrypoint.sh
COPY ./openeducat_activity /mnt/extra-addons/openeducat_activity
COPY ./openeducat_admission /mnt/extra-addons/openeducat_admission
COPY ./openeducat_assignment /mnt/extra-addons/openeducat_assignment
COPY ./openeducat_attendance /mnt/extra-addons/openeducat_attendance
COPY ./openeducat_classroom /mnt/extra-addons/openeducat_classroom
COPY ./openeducat_core /mnt/extra-addons/openeducat_core
COPY ./openeducat_erp /mnt/extra-addons/openeducat_erp
COPY ./openeducat_exam /mnt/extra-addons/openeducat_exam
COPY ./openeducat_facility /mnt/extra-addons/openeducat_facility
COPY ./openeducat_fees /mnt/extra-addons/openeducat_fees
COPY ./openeducat_library /mnt/extra-addons/openeducat_library
COPY ./openeducat_parent /mnt/extra-addons/openeducat_parent
COPY ./openeducat_timetable /mnt/extra-addons/openeducat_timetable
COPY ./theme_web_openeducat /mnt/extra-addons/theme_web_openeducat

RUN chown -R odoo:odoo /etc/odoo/odoo.conf /mnt/extra-addons /usr/local/bin/openeducat-entrypoint.sh && chmod +x /usr/local/bin/openeducat-entrypoint.sh

USER odoo

ENTRYPOINT ["/usr/local/bin/openeducat-entrypoint.sh"]
CMD ["odoo"]
