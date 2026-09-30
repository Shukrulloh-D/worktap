export const Input = ({ label, error, className = '', ...props }) => (
  <div style={{ display: 'flex', flexDirection: 'column', gap: 6, width: '100%' }}>
    {label && <label style={{ fontSize: 13, fontWeight: 600 }}>{label}</label>}
    <input className={`input ${className}`} {...props} />
    {error && <span style={{ color: 'var(--danger)', fontSize: 12 }}>{error}</span>}
  </div>
);
