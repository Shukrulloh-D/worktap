import { useEffect } from 'react';
const ov = { position: 'fixed', inset: 0, background: 'rgba(31,31,31,0.6)', display: 'flex', alignItems: 'center', justifyContent: 'center', zIndex: 1000, padding: 20, animation: 'fadeIn 0.2s' };
const ct = { background: 'white', padding: 32, borderRadius: 16, maxWidth: 720, width: '100%', maxHeight: '90vh', overflowY: 'auto', position: 'relative', animation: 'fadeInScale 0.3s' };
const cl = { position: 'absolute', top: 16, right: 16, width: 36, height: 36, borderRadius: '50%', fontSize: 18, color: 'var(--gray)', cursor: 'pointer' };
export const Modal = ({ isOpen, onClose, children, maxWidth }) => {
  useEffect(() => {
    const onEsc = (e) => { if (e.key === 'Escape') onClose(); };
    if (isOpen) document.addEventListener('keydown', onEsc);
    return () => document.removeEventListener('keydown', onEsc);
  }, [isOpen, onClose]);
  if (!isOpen) return null;
  return (
    <div style={ov} onClick={onClose}>
      <div style={{ ...ct, maxWidth: maxWidth || 720 }} onClick={(e) => e.stopPropagation()}>
        <button style={cl} onClick={onClose}>x</button>
        {children}
      </div>
    </div>
  );
};
