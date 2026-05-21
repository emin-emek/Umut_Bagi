from flask import Blueprint, jsonify
from app.routes.auth import auth_bp
from app.routes.main import listings_bp

# Merkez API Blueprint'i
api_bp = Blueprint('api', __name__)

# Alt Blueprint'leri Merkez API'ye kaydet
api_bp.register_blueprint(auth_bp)
api_bp.register_blueprint(listings_bp)

@api_bp.route('/health')
def health():
    """Uygulama sağlık kontrolü API'si."""
    return jsonify({"status": "healthy"}), 200
