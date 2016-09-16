# Importar las dependencias de flask
from flask import Blueprint, request, render_template, flash, g, session, redirect, url_for

# Importar clave / ayudantes de encriptacion
from werkzeug import check_password_hash, generate_password_hash

# Importar el objeto de base de datos desde el modulo principal de la aplicacion
from app import db

# Importar modulo de formulario
#from app.mod_curia.forms import LoginForm

# Importar modulo de usuario (i.e. User)
#from app.mod_curia.models import User

# Definir el blueprint: 'auth', establecer el prefijo de la url: app.url/auth
mod_ecclesi = Blueprint('ecclesi', __name__, url_prefix='/ecclesi')

# Establecer las rutas y metodos aceptados
@mod_ecclesi.route('/descarga/', methods=['GET', 'POST'])
def descarga():
    return render_template("ecclesi/descarga.html") 