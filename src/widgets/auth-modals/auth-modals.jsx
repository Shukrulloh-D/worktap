import { useState } from 'react';
import { useAuth } from 'shared/lib/auth';
import { useToast } from 'shared/lib/toast';
import { Modal } from 'shared/ui/modal';
import styles from './auth-modals.module.css';

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
      <h2 className={styles.title}>{isLogin ? 'Вход' : 'Регистрация'}</h2>
      <p className={styles.subtitle}>{isLogin ? 'Войдите в свой аккаунт' : 'Создайте новый аккаунт'}</p>
      <form className={styles.form} onSubmit={submit}>
        {!isLogin && <input className="input" placeholder="ФИО" />}
        <input className="input" placeholder="Email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        <input className="input" placeholder="Пароль" type="password" value={pwd} onChange={(e) => setPwd(e.target.value)} />
        <button type="submit" className={`btn btn-primary btn-full ${styles.submit}`}>
          {isLogin ? 'Войти' : 'Зарегистрироваться'}
        </button>
      </form>
      <div className={styles.bottom}>
        {isLogin ? 'Нет аккаунта? ' : 'Уже есть аккаунт? '}
        <button className={styles.switch} onClick={() => onSwitch(isLogin ? 'signup' : 'login')}>
          {isLogin ? 'Регистрация' : 'Войти'}
        </button>
      </div>
    </Modal>
  );
};
