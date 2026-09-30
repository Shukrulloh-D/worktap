import { useState } from 'react';
import { useAuth } from 'shared/lib/auth';
import { useToast } from 'shared/lib/toast';
import { Modal } from 'shared/ui/modal';

export const AuthModals = ({ isOpen, mode, onClose, onSwitch }) => {
  const { login } = useAuth();
  const toast = useToast();
  const [email, setEmail] = useState('');
  const [pwd, setPwd] = useState('');

  const submit = (e) => {
    e.preventDefault();
    if (!email.includes('@')) { toast('Введите корректный email'); return; }
    if (pwd.length < 4) { toast('Пароль минимум 4 символа'); return; }
    login(email);
    toast('Вы вошли в аккаунт');
    onClose();
  };

  if (!isOpen) return null;
  const isLogin = mode === 'login';

  return (
    <Modal isOpen={isOpen} onClose={onClose} maxWidth={460}>
      <h2 style={{ fontSize: 24, fontWeight: 800, marginBottom: 8, textAlign: 'center' }}>
        {isLogin ? 'Вход' : 'Регистрация'}
      </h2>
      <p style={{ fontSize: 13, color: '#8B8B8B', textAlign: 'center', marginBottom: 24 }}>
        {isLogin ? 'Войдите в свой аккаунт' : 'Создайте новый аккаунт'}
      </p>
      <form onSubmit={submit} style={{ display: 'flex', flexDirection: 'column', gap: 16 }}>
        {!isLogin && <input className="input" placeholder="ФИО" />}
        <input className="input" placeholder="Email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        <input className="input" placeholder="Пароль" type="password" value={pwd} onChange={(e) => setPwd(e.target.value)} />
        <button type="submit" className="btn btn-primary btn-full" style={{ padding: 14 }}>
          {isLogin ? 'Войти' : 'Зарегистрироваться'}
        </button>
      </form>
      <div style={{ textAlign: 'center', marginTop: 16, fontSize: 13, color: '#8B8B8B' }}>
        {isLogin ? 'Нет аккаунта? ' : 'Уже есть аккаунт? '}
        <button onClick={() => onSwitch(isLogin ? 'signup' : 'login')} style={{ color: '#21B349', fontWeight: 700, background: 'none', border: 'none', cursor: 'pointer' }}>
          {isLogin ? 'Регистрация' : 'Войти'}
        </button>
      </div>
    </Modal>
  );
};
