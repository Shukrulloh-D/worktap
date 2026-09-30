export const Button = ({ children, variant = 'primary', size = '', className = '', full, ...props }) => (
  <button className={`btn btn-${variant} ${size === 'sm' ? 'btn-sm' : size === 'lg' ? 'btn-lg' : ''} ${full ? 'btn-full' : ''} ${className}`} {...props}>{children}</button>
);
