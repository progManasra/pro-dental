function requireRoles(...roles) {
  return (req, res, next) => {
    const role = req.user?.role;
    if (!role) return res.status(401).json({ ok: false, error: 'Not authenticated' });
    if (!roles.includes(role)) return res.status(403).json({ ok: false, error: 'Forbidden' });
    next();
  };
}

module.exports = { requireRoles };
